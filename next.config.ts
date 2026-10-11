import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  images: {
    remotePatterns: [
      {
        protocol: "https",
        hostname: "www.seggfaye.com",
      },
      {
        protocol: "https",
        hostname: "seggfaye.com",
      },
    ],
  },
};

export default nextConfig;
