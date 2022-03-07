export async function get({ params }) {
    return {
        status: 200,
        headers: {
            "content-type": "application/json",
        },
        body: {
            message: "Hello, World!",
        },
    };
}
