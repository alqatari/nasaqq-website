# Nasaqq Website

A fast, modern static website built with Elm for Nasaqq - AI solutions company specializing in algorithmic trading, real estate fintech, and IT architecture advisory.

## Features

- 🚀 **Blazing Fast**: Elm compiles to optimized JavaScript (~30-50kb bundle)
- ✅ **Zero Runtime Exceptions**: Elm's type system prevents runtime errors
- 📱 **Fully Responsive**: Works perfectly on all devices
- 🎨 **Modern Design**: Professional UI with smooth animations
- ⚡ **Static Site**: Perfect for GitHub Pages, custom domains
- 🔧 **Easy to Maintain**: Strong typing catches errors at compile time
- 🔄 **Live Reload**: Hot reloading during development with elm-live

## Quick Start

### Prerequisites

- [Node.js](https://nodejs.org/) (for development tools)
- [Elm](https://elm-lang.org/install) (0.19.1)

### Setup Development Environment

1. **Clone or setup the project:**
   ```bash
   # If you haven't cloned yet
   git clone https://github.com/alqatari/nasaqq-website.git
   cd nasaqq-website
   ```

2. **Run the setup script:**
   ```bash
   chmod +x setup-dev.sh
   ./setup-dev.sh
   ```

### Development Workflow

**Start development server with live reload:**
```bash
npm run dev
```

This will:
- ✅ Start elm-live development server
- ✅ Open your browser automatically 
- ✅ Watch for file changes
- ✅ Automatically recompile and reload
- ✅ Show build errors in browser

**Development with Elm debugger:**
```bash
npm run dev-debug
```

**Build for production:**
```bash
npm run build
```

**Deploy updates:**
```bash
npm run deploy
```

## Available Scripts

| Command | Description |
|---------|-------------|
| `npm run dev` | Start development server with live reload |
| `npm run dev-debug` | Development server with Elm time-travel debugger |
| `npm run build` | Build optimized production version |
| `npm run build-debug` | Build development version (faster, larger) |
| `npm run deploy` | Build and deploy to GitHub Pages |
| `npm run clean` | Remove build files |

## Development Tips

### **Live Reload Workflow:**
1. Run `npm run dev` once
2. Edit `src/Main.elm` 
3. Save file → automatic rebuild → browser refreshes
4. See errors instantly in browser or terminal

### **Debugging:**
- Use `npm run dev-debug` to enable Elm's time-travel debugger
- Add `Debug.log "message" value` in your Elm code for debugging
- Remove debug statements before production build

### **Fast Development Cycle:**
```bash
# Terminal 1: Keep this running
npm run dev

# Terminal 2: For git operations
git add .
git commit -m "Your changes"
git push
```

## Project Structure

```
nasaqq-website/
├── src/
│   └── Main.elm              # Main Elm application
├── elm.json                  # Elm dependencies
├── package.json              # Node.js dependencies and scripts
├── index.html                # HTML template
├── main.js                   # Compiled Elm output (auto-generated)
├── nasaqq_logo.png          # Company logo
├── CNAME                     # Custom domain configuration
├── setup-dev.sh             # Development environment setup
├── deploy-github-pages.sh   # Initial deployment script
├── update-website.sh        # Quick update deployment
└── README.md                # This file
```

## Deployment

### Initial Deployment to GitHub Pages:
```bash
./deploy-github-pages.sh
```

### Custom Domain (nasaqq.com):
```bash
./setup-custom-domain.sh
```

### Regular Updates:
```bash
npm run deploy "Your update message"
```

## Customization

### Updating Content

The content is structured in `src/Main.elm` with clear sections:
- **Hero Section**: Main landing content with credentials
- **Services**: Three main service offerings
- **Training**: Training programs for different audiences  
- **About**: Detailed company and leadership information
- **Contact**: Contact form and details

### Styling

The website uses Tailwind CSS. Custom colors and animations are defined in `index.html`:

- **Brand Colors**: 
  - Red: `#FF2800` (Nasaqq red)
  - Blue: `#0062FF` (Nasaqq blue)
- **Fonts**: Inter (Google Fonts)
- **Animations**: Custom blob animations and transitions

### Adding New Pages

1. Add a new page type to the `Page` union type in `Main.elm`
2. Add the page to the navbar in `navbar` function
3. Create a view function for the new page
4. Update the `viewPage` function to handle the new page

## Performance

- **Bundle Size**: ~30-50kb (vs 200kb+ for typical React apps)
- **Load Time**: Sub-second on fast connections
- **SEO Friendly**: Static HTML generation
- **No Runtime Errors**: Elm's guarantees

## Browser Support

- Chrome (last 2 versions)
- Firefox (last 2 versions)  
- Safari (last 2 versions)
- Edge (last 2 versions)

## Live URLs

- **Production**: https://nasaqq.com
- **GitHub Pages**: https://alqatari.github.io/nasaqq-website
- **Development**: http://localhost:8000 (when running `npm run dev`)

## Troubleshooting

### Development Issues:

**"elm-live not found":**
```bash
./setup-dev.sh  # Run setup script
```

**"Port already in use":**
```bash
# Kill existing process or use different port
npm run dev -- --port=8001
```

**"Build fails":**
- Check Elm syntax errors in terminal
- Ensure all imports are correct
- Run `elm make src/Main.elm` directly to see detailed errors

### Deployment Issues:

**"Permission denied" on scripts:**
```bash
chmod +x *.sh
```

**"DNS not working":**
- Check GoDaddy DNS settings
- Wait 1-2 hours for propagation
- Test at: https://dnschecker.org

## Contact

- **Website**: https://nasaqq.com
- **Email**: alqatari@mac.com
- **LinkedIn**: https://www.linkedin.com/in/alqatari
- **Mobile**: +966-56-2222-690
- **CR No**: 7014302686

## License

MIT License - feel free to use for your own projects.
