FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy built application
COPY dist ./dist
COPY src ./src

# Create non-root user
RUN addgroup -g 1001 -S scanner && \
    adduser -S scanner -u 1001

USER scanner

ENTRYPOINT ["node", "dist/cli/index.js"]
CMD ["scan"]
