(() => {
    const modelViewers = document.querySelectorAll('model-viewer');
    const cards = document.querySelectorAll('.card');
    const defaultOrbit = '64deg 25deg 64m';
    const hoverOrbit = '90deg -42deg 80m';
    const applyOrbit = (modelViewer, orbit) => {
      modelViewer.setAttribute('camera-orbit', orbit);
      modelViewer.setAttribute('interpolation-decay', '200');
    };
    cards.forEach((card, index) => {
      const modelViewer = modelViewers[index];
      if (modelViewer) {
        card.addEventListener('mouseenter', () => applyOrbit(modelViewer, hoverOrbit));
        card.addEventListener('mouseleave', () => applyOrbit(modelViewer, defaultOrbit));
        modelViewer.addEventListener('load', () => {
          modelViewer.classList.add('loaded');
        });
      } else {
        console.log(`No model found for card at i:${index}`);
      }
    });
  })();
  function changeModelStyle(element, deg, invert = 0) {
    const card = element.closest('.card');
    const modelViewer = card.querySelector('model-viewer');
    if (modelViewer) { modelViewer.style.filter = `hue-rotate(${deg}deg) invert(${invert})`; }
  }