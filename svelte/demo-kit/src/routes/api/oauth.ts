import type { RequestHandler } from '@sveltejs/kit';
import jsonwebtoken from 'jsonwebtoken';

export const get: RequestHandler = async ({ url }) => {
    const TENANT_ID = '53244bbe-ee09-4ab0-9f7f-a4854b23a664';
    const CLIENT_ID = '87343338-7e9c-4d87-8f86-a605cefa4092';
    const CLIENT_SECRET = '2su7Q~cZ2Y1_dC6EnEiYIpQOsWZfRFvr2G3ay';
    let token_url = `https://login.microsoftonline.com/${TENANT_ID}/oauth2/v2.0/token`;

    const code = url.searchParams.get('code');
    const scope = 'openid offline_access https://graph.microsoft.com/mail.read';
    const tokenResponse = await fetch(token_url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            grant_type: 'authorization_code',
            client_id: CLIENT_ID,
            client_secret: CLIENT_SECRET,
            redirect_uri: 'http://localhost:3000/api/oauth',
            scope,
            code
        })
    });

    const token = await tokenResponse.json();

    // Get user info
    const userInfoResponse = await fetch(`https://graph.microsoft.com/v1.0/me`, {
        headers: {
            Authorization: `Bearer ${token.access_token}`
        }
    });
    const userInfo = await userInfoResponse.json();

    const subInfo = {
        id: userInfo.id,
        userPrincipalName: userInfo.userPrincipalName,
        displayName: userInfo.displayName
    };
    const hour = 3600;

    const signedToken = jsonwebtoken.sign(
        subInfo,
        import.meta.env.VITE_JWT_SECRET as string,
        {
            expiresIn: '3h'
        }
    );

    // Cookie
    const expires = 3 * hour;

    return {
        status: 302,
        headers: {
            'Set-Cookie': `token=${signedToken}; max-age=${expires}; HttpOnly; Secure; path=/;`,
            Location: '/dashboard/libs'
        }
    };
};
