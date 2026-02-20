const express = require('express');
const app = express();
const PORT = process.env.PORT || 3000;

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy' });
});

app.get('/', (req, res) => {
  res.send(`
    <html>
      <head><title>CI/CD Works!</title></head>
      <body style="font-family:sans-serif; display:flex; justify-content:center; align-items:center; height:100vh; margin:0; background:#1a1a2e; color:#e2e8f0;">
        <div style="text-align:center;">
          <h1 style="color:#10b981; font-size:3rem;">CI/CD Pipeline Works!</h1>
          <p style="font-size:1.2rem;">This was deployed automatically by GitHub Actions</p>
          <p style="color:#94a3b8;">Container: ${require('os').hostname()}</p>
          <p style="color:#f59e0b;">Deployed at: ${new Date().toISOString()}</p>
        </div>
      </body>
    </html>
  `);
});

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
