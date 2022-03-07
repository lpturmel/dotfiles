import type { User } from 'src/types/auth';
import { writable } from 'svelte/store';

export const userStore = writable<User>(null);
