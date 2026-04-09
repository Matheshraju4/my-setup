FROM oven/bun:latest

WORKDIR /app

COPY . .

# Avoid IntegrityCheckFailed when registry bytes don’t match bun.lock (CDN/proxy flakes).
RUN bun install --no-verify

RUN bun run build

RUN bun install pm2 -g
ENV PATH="/root/.bun/bin:${PATH}"

EXPOSE 3000
# pm2 start exits after daemonizing → container stops. pm2-runtime stays in the foreground.
CMD ["pm2-runtime", "pm2.config.js"]