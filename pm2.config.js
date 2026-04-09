const home = process.env.HOME || process.env.USERPROFILE || "";

module.exports = {
  apps: [
    {
      name: "app",
      cwd: __dirname,
      script: "bun",
      args: "run start -- -H 0.0.0.0",
      interpreter: "none",
      env: {
        PATH: `${home}/.bun/bin:${process.env.PATH}`,
      },
    },
  ],
};
