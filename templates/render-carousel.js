#!/usr/bin/env node
/**
 * 🟢 IG VIRAL ENGINE — Carousel Renderer
 * Converts HTML carousels to PNG images using Puppeteer
 * 
 * Usage: node render-carousel.js <html-file> <output-dir>
 * 
 * FREE — no external APIs, no paid services
 */

const puppeteer = require('puppeteer');
const fs = require('fs');
const path = require('path');

async function renderCarousel(htmlPath, outputDir) {
  console.log('🟢 VIRAL ENGINE — Rendering Carousel...');
  console.log(`📄 HTML: ${htmlPath}`);
  console.log(`📁 Output: ${outputDir}`);
  
  // Ensure output directory exists
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }
  
  // Read HTML
  const html = fs.readFileSync(htmlPath, 'utf8');
  
  // Launch browser
  const browser = await puppeteer.launch({
    headless: 'new',
    args: [
      '--no-sandbox',
      '--disable-setuid-sandbox',
      '--disable-dev-shm-usage',
      '--disable-gpu'
    ]
  });
  
  try {
    const page = await browser.newPage();
    
    // Set viewport to Instagram carousel size
    await page.setViewport({
      width: 1080,
      height: 1080,
      deviceScaleFactor: 1
    });
    
    // Load HTML
    await page.setContent(html, {
      waitUntil: 'networkidle0',
      timeout: 30000
    });
    
    // Wait for fonts to load
    await page.evaluateHandle('document.fonts.ready');
    await new Promise(r => setTimeout(r, 2000));
    
    // Find all slides
    const slides = await page.$$('.slide');
    console.log(`📊 Found ${slides.length} slides`);
    
    const imagePaths = [];
    
    // Capture each slide
    for (let i = 0; i < slides.length; i++) {
      const slideNum = String(i + 1).padStart(2, '0');
      const imgPath = path.join(outputDir, `slide_${slideNum}.png`);
      
      await slides[i].screenshot({
        path: imgPath,
        type: 'png',
        omitBackground: false
      });
      
      imagePaths.push(imgPath);
      console.log(`✅ Captured slide ${slideNum}: ${imgPath}`);
    }
    
    // Also capture full carousel as single image (for preview)
    const fullPath = path.join(outputDir, 'carousel_full.png');
    await page.screenshot({
      path: fullPath,
      type: 'png',
      fullPage: true
    });
    console.log(`✅ Full carousel preview: ${fullPath}`);
    
    // Generate metadata
    const metadata = {
      slides: imagePaths.length,
      images: imagePaths,
      fullPreview: fullPath,
      renderedAt: new Date().toISOString(),
      dimensions: '1080x1080'
    };
    
    fs.writeFileSync(
      path.join(outputDir, 'metadata.json'),
      JSON.stringify(metadata, null, 2)
    );
    
    console.log('\n🎉 RENDER COMPLETE!');
    console.log(`📁 Output directory: ${outputDir}`);
    console.log(`📊 Total slides: ${imagePaths.length}`);
    console.log('\n📤 Ready for Instagram upload!');
    
    return metadata;
    
  } finally {
    await browser.close();
  }
}

// CLI execution
if (require.main === module) {
  const htmlPath = process.argv[2];
  const outputDir = process.argv[3] || './output';
  
  if (!htmlPath) {
    console.error('❌ Usage: node render-carousel.js <html-file> [output-dir]');
    process.exit(1);
  }
  
  renderCarousel(htmlPath, outputDir)
    .then(meta => {
      console.log('\n✅ Success! Images ready for posting.');
      process.exit(0);
    })
    .catch(err => {
      console.error('❌ Error:', err.message);
      process.exit(1);
    });
}

module.exports = { renderCarousel };
