// app/src/index.js

const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

// Health check endpoint — ALB hits this to know the container is alive
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy' });
});

// Main page
app.get('/', (req, res) => {
  res.send(`
    <html>
      <head><title>AWS Web App</title></head>
      <body style="font-family:sans-serif; display:flex; justify-content:center; align-items:center; height:100vh; margin:0; background:#0a0e17; color:#e2e8f0;">
        <div style="text-align:center;">
          <h1 style="color:#f59e0b;">🚀 AWS Web App is Live!</h1>
          <p>Running on ECS Fargate behind an ALB</p>
          <p style="color:#94a3b8;">Container ID: ${require('os').hostname()}</p>
        </div>
      </body>
    </html>
  `);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
