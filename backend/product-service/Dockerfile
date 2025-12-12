FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
ENV MONGODB_URI=mongodb+srv://deeps19nija_db_user:epDmXHFEVq2wmzDF@herovired-deepalicluste.l09w30m.mongodb.net/ecommerce_products
ENV PORT=3002
EXPOSE 3002
CMD ["npm", "start"]