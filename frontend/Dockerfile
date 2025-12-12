FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
ENV REACT_APP_USER_SERVICE_URL=http://localhost:3001
ENV REACT_APP_PRODUCT_SERVICE_URL=http://localhost:3002
ENV REACT_APP_CART_SERVICE_URL=http://localhost:3003
ENV REACT_APP_ORDER_SERVICE_URL=http://localhost:3004
ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]