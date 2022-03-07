import type { GetSession, Handle } from '@sveltejs/kit';
import { parse } from 'cookie';
import jsonwebtoken from 'jsonwebtoken';
import type { User } from './types/auth';

export const handle: Handle = async ({ resolve, event }) => {
    const cookies = parse(event.request.headers.get('Cookie') || '');

    if (cookies.token) {
        console.log('token found');
        const payload = jsonwebtoken.verify(
            cookies.token,
            import.meta.env.VITE_JWT_SECRET as string
        );
        event.locals.user = payload as User;
        return resolve(event);
    }
    console.log('Request is unauthenticated');
    event.locals.user = null;
    return resolve(event);
};

export const getSession: GetSession = async request => {
    return request.locals.user
        ? {
              user: {
                  ...request.locals.user
              }
          }
        : {};
};
