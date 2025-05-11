/**
 * System information service
 */
function getSystemInfo() {
  return {
    node: {
      version: process.version,
      platform: process.platform,
      arch: process.arch,
      memory: process.memoryUsage(),
      uptime: process.uptime()
    },
    env: {
      nodeEnv: process.env.NODE_ENV || 'development'
    },
    system: {
      timestamp: new Date().toISOString(),
      hostname: process.env.HOSTNAME || 'local'
    }
  };
}

module.exports = {
  getSystemInfo
};