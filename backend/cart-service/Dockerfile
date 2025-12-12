FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
ENV MONGODB_URI=mongodb+srv://deeps19nija_db_user:epDmXHFEVq2wmzDF@herovired-deepalicluste.l09w30m.mongodb.net/ecommerce_carts
ENV PRODUCT_SERVICE_URL=http://localhost:3002
ENV PORT=3003
EXPOSE 3003
CMD ["npm", "start"]
