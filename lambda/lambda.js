exports.handler = async (event) => {
    try {
        console.log('entrou na função')
        const { name } = event.queryStringParameters
        const response = {
            statusCode: 200,
            body: `ECHO ${name}`,
        };
        return response;
    } catch (e) {
        return {
            statusCode: 500,
            body: "Lembrou de colocar os query parameters num1 e num2?"
        }
    }
};