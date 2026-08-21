export default function Logo({ size = 'md' }) {
  const sizes = { sm: 'text-xl', md: 'text-2xl', lg: 'text-4xl' }
  return (
    <div className={`font-display font-extrabold ${sizes[size]} flex items-center gap-1.5`}>
      <span className="inline-flex items-center justify-center w-[1.15em] h-[1.15em] rounded-xl bg-[var(--color-esmeralda)] text-white">
        📘
      </span>
      <span className="text-[var(--color-indigo)]">Escola</span>
      <span className="text-[var(--color-esmeralda)]">Digital</span>
    </div>
  )
}
