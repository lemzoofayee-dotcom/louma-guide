import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // 12/11/2026 : « sauce thieboudienne » n'existe pas (Lamine) ; la sauce du thieb rouge = la sauce diaga
  async redirects() {
    return [
      { source: "/plats/sauce-thieboudienne", destination: "/plats/thiebou-diaga", permanent: true },
    ];
  },
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
