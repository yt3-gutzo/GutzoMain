import type { CapacitorConfig } from "@capacitor/cli";

const config: CapacitorConfig = {
  appId: "com.gutzo.app",
  appName: "Gutzo",
  plugins: {
    CapacitorHttp: { enabled: true },
  },
  ios: {
    allowsLinkPreview: false,
    scrollEnabled: true,
    contentInset: "always",
    // @ts-ignore - Valid runtime config for iOS swipe gestures
    allowsBackForwardNavigationGestures: true,
  },
};

export default config;
