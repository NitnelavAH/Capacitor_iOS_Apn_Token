export interface CapacitorApnTokenPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
