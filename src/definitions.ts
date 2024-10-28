export interface CapacitorApnTokenPlugin {
  getApnsToken(): Promise<{ token: string }>;
}
