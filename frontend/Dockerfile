##### Deploy release #######
# See: https://nextjs.org/docs/deployment
# See: https://github.com/vercel/next.js/tree/canary/examples/with-docker
# https://www.oddicles.net/blog/next-js-dockerfile-using-npm-instead-of-yarn/

# Production image, copy all the files and run next
FROM node:16-alpine AS runner
WORKDIR /app

ENV NODE_ENV production
ENV PORT 3000
EXPOSE 3000

RUN addgroup -g 1001 -S nodejs
RUN adduser -S nextjs -u 1001

# You only need to copy next.config.js if you are NOT using the default configuration
# COPY release/next.config.js ./
COPY release/public ./public
COPY release/package.json ./package.json

# Automatically leverage output traces to reduce image size 
# https://nextjs.org/docs/advanced-features/output-file-tracing
COPY --chown=nextjs:nodejs release/.next/standalone ./
COPY --chown=nextjs:nodejs release/.next/static ./.next/static

USER nextjs

# Next.js collects completely anonymous telemetry data about general usage.
# Learn more here: https://nextjs.org/telemetry
# Uncomment the following line in case you want to disable telemetry.
ENV NEXT_TELEMETRY_DISABLED 1

CMD ["node", "server.js"]