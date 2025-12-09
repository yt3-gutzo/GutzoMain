"use strict";

const express = require("express");
const bodyParser = require("body-parser");
const PaytmChecksum = require("./utils/paytmChecksum");

const app = express();
app.use(bodyParser.json());

// health check
app.get("/", (req, res) => {
  res.send({ status: "running", service: "Gutzo Paytm Microservice" });
});

/**
 * 1) Generate Checksum
 */
app.post("/generate-checksum", async (req, res) => {
  try {
    // Accept flat params and merchantKey, like sample.js
    const { merchantKey, ...params } = req.body;

    if (!merchantKey || Object.keys(params).length === 0) {
      return res.status(400).json({ error: "merchantKey and params are required" });
    }

    // Pass flat params to generateSignature
    const checksum = await PaytmChecksum.generateSignature(params, merchantKey);

    res.json({
      checksum,
      message: "Checksum generated successfully",
    });

  } catch (err) {
    res.status(500).json({ error: err.toString() });
  }
});

/**
 * 2) Verify Checksum
 */
app.post("/verify-checksum", async (req, res) => {
  try {
    const { body, merchantKey, checksum } = req.body;

    if (!body || !merchantKey || !checksum) {
      return res.status(400).json({ error: "body, merchantKey, checksum are required" });
    }

    const isValid = PaytmChecksum.verifySignature(body, merchantKey, checksum);

    res.json({
      valid: isValid,
      message: isValid ? "Checksum is valid" : "Checksum is invalid"
    });

  } catch (err) {
    res.status(500).json({ error: err.toString() });
  }
});

/**
 * 3) STARTER: Initiate Transaction from your Backend
 */
app.post("/initiate-transaction", async (req, res) => {
  try {
    const axios = require("axios");

    const { mid, orderId, amount, merchantKey } = req.body;

    // Build full payload for transaction request
    const paytmParams = {
      mid,
      orderId,
      requestType: "Payment",
      txnAmount: {
        value: amount,
        currency: "INR"
      },
      userInfo: {
        custId: "CUST_001"
      },
      callbackUrl: "gutzo.in/paytm-callback", // <-- Add your callback URL here
      industryType: "Retail",
      channelId: "WEB",
      websiteName: "WEBSTAGING",
    };

    // Generate checksum from the stringified payload (as required by Paytm)
    const checksum = await PaytmChecksum.generateSignature(JSON.stringify(paytmParams), merchantKey);
    console.log("Generated Checksum:", checksum);

    const payload = {
      body: paytmParams,
      head: { signature: checksum }
    };

    const response = await axios.post(
      `https://secure.paytmpayments.com/theia/api/v1/initiateTransaction?mid=${mid}&orderId=${orderId}`,
      payload,
      { headers: { "Content-Type": "application/json" } }
    );
    console.log("Paytm initiateTransaction response:", response.data);
    res.json({
      checksum,
      initiateTransactionResponse: response.data
    });

  } catch (err) {
    res.status(500).json({ error: err.toString() });
  }
});

// start server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log("🚀 Paytm Service running on port", PORT);
});
