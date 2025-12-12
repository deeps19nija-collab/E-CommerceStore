FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
ENV MONGODB_URI=mongodb+srv://deeps19nija_db_user:epDmXHFEVq2wmzDF@herovired-deepalicluste.l09w30m.mongodb.net/ecommerce_orders
ENV PORT=3004
ENV CART_SERVICE_URL=http://localhost:3003
ENV PRODUCT_SERVICE_URL=http://localhost:3002
ENV USER_SERVICE_URL=http://localhost:3001
EXPOSE 3004
CMD ["npm", "start"]
