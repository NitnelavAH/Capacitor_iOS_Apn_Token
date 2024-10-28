import { WebPlugin } from '@capacitor/core';

import type { CapacitorApnTokenPlugin } from './definitions';

export class CapacitorApnTokenWeb extends WebPlugin implements CapacitorApnTokenPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
