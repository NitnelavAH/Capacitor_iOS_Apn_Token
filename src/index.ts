import { registerPlugin } from '@capacitor/core';

import type { CapacitorApnTokenPlugin } from './definitions';

const CapacitorApnToken = registerPlugin<CapacitorApnTokenPlugin>('CapacitorApnToken', {
  web: () => import('./web').then((m) => new m.CapacitorApnTokenWeb()),
});

export * from './definitions';
export { CapacitorApnToken };
