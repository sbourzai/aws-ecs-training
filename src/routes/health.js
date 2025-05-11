const express = require('express');
const router = express.Router();

// Health check routes
router.get('/', (req, res) => {
  res.json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: process.uptime()
  });
});

router.get('/detailed', (req, res) => {
  const healthInfo = {
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptime: process.uptime(),
    memoryUsage: process.memoryUsage(),
    cpuUsage: process.cpuUsage(),
    version: process.version,
    platform: process.platform,
    hostname: process.env.HOSTNAME || 'local'
  };
  
  res.json(healthInfo);
});

module.exports = { healthRoutes: router };