import type { RequestHandler } from '@sveltejs/kit';

export const post: RequestHandler = async () => {
    return {
        status: 302,
        headers: {
            'Set-Cookie': 'token=; max-age=0; HttpOnly; Secure; path=/;',
            Location: '/login'
        }
    };
};
