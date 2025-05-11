const express = require('express');
const cors = require('cors');
const morgan = require('morgan');
const { infoRoutes } = require('./routes/info');
const { healthRoutes } = require('./routes/health');

// Initialize Express app
const app = express();
const PORT = process.env.PORT || 3000;

// Apply middleware
app.use(cors());
app.use(express.json());
app.use(morgan('combined'));

// Register routes
app.use('/api/info', infoRoutes);
app.use('/api/health', healthRoutes);

// Root route
app.get('/', (req, res) => {
  res.json({
    message: 'Welcome to the AWS ECS Demo API',
    version: '1.0.0',
    docs: '/api/info'
  });
});

// Start the server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
  console.log(`Environment: ${process.env.NODE_ENV || 'development'}`);
  console.log(`Container ID: ${process.env.HOSTNAME || 'local'}`);
});