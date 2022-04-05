const puppeteer = require('puppeteer');

(async () => {
  const TIMEOUT = 1000
  const browser = await puppeteer.launch();
  const page = await browser.newPage();
  await page.goto('https://www.podbean.com/science-podcasts');

  // Change waitForTimeout later, nice to have
  while (((await page.$('#load-more')) || "") != "") {
    await page.click('#load-more')
    await page.waitForTimeout(TIMEOUT);
  };

  var podcastList = await page.evaluate(() =>
    Array.from(
      document.querySelectorAll('div.span3 > a > img'),
      (image) => [image.getAttribute("src"),image.getAttribute("alt")]
    ).concat(
      Array.from(
        document.querySelectorAll('ul.ul-list > li > a > img'),
        (image) => [image.getAttribute("src"),image.getAttribute("alt")]
      )
    )
  );

  console.log(podcastList.length)
  console.log(podcastList[podcastList.length-1])

  await browser.close();
})();