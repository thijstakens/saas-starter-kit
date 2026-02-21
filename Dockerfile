FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY prisma ./prisma/
RUN npx prisma generate

EXPOSE 4002

CMD ["sh", "-c", "npx prisma db push && npm run dev"]
