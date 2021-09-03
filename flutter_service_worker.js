'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "main.dart.js": "203e85e7a43fdbfc3e56a1824d21f26c",
"version.json": "a8f83101c2f51eceebd1cdcc7b8ff5fc",
"manifest.json": "ecf8d4eea71ae54799788ad9586a3654",
"icons/Icon-512.png": "d2f5d6ffc41f7a4d3d05d00fea7c8b72",
"icons/Icon-192.png": "0ba73cd722a14d89e29f5d13a24294a2",
"icons/favicon.png": "8d159029077b9d6629ada4690b3baec0",
"icons/favicon.ico": "1665e4bb03d060b66d2a82641167a46e",
"index.html": "7658cacfb7cbe56d9a4ea98e8bfbe38c",
"/": "7658cacfb7cbe56d9a4ea98e8bfbe38c",
"assets/NOTICES": "64d00b5bbeaa5017e27ab6cecd990dc6",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/AssetManifest.json": "07a9cf3e5ff21344b750fced6150aff1",
"assets/FontManifest.json": "e024588c84b5d20cb7869d6f908130e8",
"assets/assets/images/pic4.jpg": "ff643eaf4d93c3adcc8f4952e92b78b8",
"assets/assets/images/6.png": "d17f31a3a8911df2461b63e321fd1c73",
"assets/assets/images/1.png": "fac37e3315e3eb12f0fddeacfa0530ce",
"assets/assets/images/7.png": "d82b90eab3f4857c6456ed40c2bc6277",
"assets/assets/images/pic1.jpg": "72c4a16e409d1f0ef538aefc19a97c0c",
"assets/assets/images/fondoAbout.jpg": "e45cd47f0582adbe2378bd74194209f0",
"assets/assets/images/5.png": "f29bca3fec6a8fa20bc2b41a12487de9",
"assets/assets/images/pic3.jpg": "296b6771f54181baac913250a917dd62",
"assets/assets/images/diplomaCeibal.jpg": "37becf7a757b51d253b6a6f5138f6e68",
"assets/assets/images/3.png": "07525dd1f45cc59bb5baa4cacab38dcc",
"assets/assets/images/8.png": "cc1f0126b663baaddf3715b30f8bb5b7",
"assets/assets/images/diplomaGeneXus.jpg": "d96ba89ecf0ecb80d9b5cd464fa862a3",
"assets/assets/images/avatar.png": "7ceb2ecd1bca2368223899eda38943d2",
"assets/assets/images/pic2.jpg": "ba044fecd49c0f380de1de612b5e0005",
"assets/assets/images/diplomaUtu.jpg": "fd397bbde0981c9b664c103dea1571a6",
"assets/assets/images/4.png": "ef3699f46da67af78c9ad1ba92c66661",
"assets/assets/images/2.png": "c8e178503d0509826efe574860abb0a0",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "23621397bc1906a79180a918e98f35b2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "8d159029077b9d6629ada4690b3baec0",
"favicon.ico": "1665e4bb03d060b66d2a82641167a46e"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
