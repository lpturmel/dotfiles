/// <reference types="@sveltejs/kit" />

import type { User } from './types/auth';

// See https://kit.svelte.dev/docs/types#the-app-namespace
// for information about these interfaces
declare global {
    declare namespace App {
        interface Locals {
            user: User;
        }
        // interface Platform {}
        // interface Session {}
        // interface Stuff {}
    }
}
