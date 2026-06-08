import type { MetadataRoute } from "next";
import { getAllSlugs } from "@/lib/queries";

const BASE = "https://guide.seggfaye.com";

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const [dishSlugs, productSlugs] = await Promise.all([
    getAllSlugs("dishes"),
    getAllSlugs("products"),
  ]);

  const now = new Date();

  const staticPages: MetadataRoute.Sitemap = [
    { url: BASE, lastModified: now, changeFrequency: "weekly", priority: 1 },
    { url: `${BASE}/plats`, lastModified: now, changeFrequency: "weekly", priority: 0.9 },
    { url: `${BASE}/produits`, lastModified: now, changeFrequency: "weekly", priority: 0.9 },
    { url: `${BASE}/recherche`, lastModified: now, changeFrequency: "monthly", priority: 0.5 },
  ];

  const dishPages: MetadataRoute.Sitemap = dishSlugs.map((slug) => ({
    url: `${BASE}/plats/${slug}`,
    lastModified: now,
    changeFrequency: "monthly",
    priority: 0.8,
  }));

  const productPages: MetadataRoute.Sitemap = productSlugs.map((slug) => ({
    url: `${BASE}/produits/${slug}`,
    lastModified: now,
    changeFrequency: "monthly",
    priority: 0.7,
  }));

  return [...staticPages, ...dishPages, ...productPages];
}
