export default function SectionLabel({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex items-center gap-2 text-[0.7rem] font-bold tracking-[0.18em] uppercase text-gold mb-4">
      {children}
      <span className="flex-1 h-px bg-[linear-gradient(90deg,var(--color-border),transparent)]" />
    </div>
  );
}
