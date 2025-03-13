FROM node:20-alpine

WORKDIR /app

COPY package*.json ./

# Install required system dependencies for Prisma
RUN apk add --no-cache \
    openssl \
    openssl-dev \
    libc6-compat \
    git

COPY . .    

RUN npm install

RUN npm run build

EXPOSE 3000

CMD [ "npm", "run", "dev" ]
