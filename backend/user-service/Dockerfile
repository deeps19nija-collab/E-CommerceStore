FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .
ENV MONGODB_URI=mongodb+srv://deeps19nija_db_user:epDmXHFEVq2wmzDF@herovired-deepalicluste.l09w30m.mongodb.net/ecommerce_users
ENV JWT_SECRET=your-jwt-secret-key
ENV PORT=3001
EXPOSE 3001
CMD ["npm", "start"]