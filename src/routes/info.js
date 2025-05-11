const express = require('express');
const router = express.Router();
const { getSystemInfo } = require('../services/system');

// Information routes
router.get('/', (req, res) => {
  res.json({
    info: 'AWS ECS Demo API Information',
    endpoints: [
      { path: '/api/info/system', description: 'System information' },
      { path: '/api/info/metadata', description: 'Container metadata' }
    ]
  });
});

router.get('/system', (req, res) => {
  res.json(getSystemInfo());
});

router.get('/metadata', (req, res) => {
  // Collect container and environment metadata
  const metadata = {
    containerId: process.env.HOSTNAME || 'local',
    environment: process.env.NODE_ENV || 'development',
    region: process.env.AWS_REGION || 'unknown',
    taskDefinition: process.env.TASK_DEFINITION || 'unknown',
    ecsCluster: process.env.ECS_CLUSTER || 'unknown',
    timestamp: new Date().toISOString()
  };
  
  res.json(metadata);
});

module.exports = { infoRoutes: router };