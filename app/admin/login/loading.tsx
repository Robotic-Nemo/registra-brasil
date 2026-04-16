import { Skeleton } from '@/components/ui/Skeleton'

export default function LoginLoading() {
  return (
    <main className="min-h-screen flex items-center justify-center px-4">
      <div className="w-full max-w-sm">
        <Skeleton className="h-6 w-36 mx-auto mb-6" />
        <div className="space-y-4">
          <Skeleton className="h-10 w-full rounded-lg" />
          <Skeleton className="h-10 w-full rounded-lg" />
        </div>
        <Skeleton className="h-3 w-56 mx-auto mt-4" />
      </div>
    </main>
  )
}
