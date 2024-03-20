module.exports = async function (context, req) {
  const name = process.env.HELLO_NAME;

  context.res = {
    body: `Hello, ${name}!`
  };
}
