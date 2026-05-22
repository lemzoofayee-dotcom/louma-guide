# Louma Guide

Guide interactif pour la cuisine senegalaise. Decouvrez quels produits (guedj, netetou, yeet...) utiliser dans chaque plat traditionnel.

App companion de [seggfaye.com](https://www.seggfaye.com) par Le Guedjologue.

## Stack

- Next.js 16 (App Router, TypeScript)
- Tailwind CSS v4
- Supabase (PostgreSQL)

## Setup

```bash
npm install
cp .env.local.example .env.local
# Remplir les variables Supabase
npm run dev
```

## Supabase

1. Creer un projet sur supabase.com
2. Executer `supabase/schema.sql` dans le SQL Editor
3. Executer `supabase/seed.sql`
4. Copier URL + anon key dans `.env.local`

## Deploy

Connecter le repo GitHub a Vercel, configurer les variables d'env, deployer.
Domaine cible : `guide.seggfaye.com`
