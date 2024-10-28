import { WebPlugin } from '@capacitor/core';

import type { CapacitorApnTokenPlugin } from './definitions';

export class CapacitorApnTokenWeb extends WebPlugin implements CapacitorApnTokenPlugin {
  getApnsToken(): Promise<{ token: string; }> {
    throw new Error('Method not implemented.');
  }
}
