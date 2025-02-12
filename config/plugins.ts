module.exports = ({ env }) => ({
    upload: {
        config: {
            provider: "local",
            providerOptions: {
                sizeLimit: 5000000, // Adjust size limit if needed
            },
        },
    },
});