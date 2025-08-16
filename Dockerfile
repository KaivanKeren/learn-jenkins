# Gunakan Node.js LTS
FROM node:20

# Set working directory
WORKDIR /app

# Copy package.json & install dependencies
COPY package.json ./
RUN npm install

# Copy semua source code
COPY . .

# Expose port
EXPOSE 3000

# Command untuk run app
CMD ["npm", "start"]
