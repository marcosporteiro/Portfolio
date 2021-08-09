'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/assets/images/pic03.jpg": "7b239b51055a6dcf5196d115f84ed3e6",
"assets/assets/images/micv.jpg": "f6083fab9dd035528c7ec2ae92eb4622",
"assets/assets/images/sobreMi.png": "a0f0cfb142579ff4131bd359e047c187",
"assets/assets/images/favicon.ico": "4151ed40fda953c92c87b60c5fdb3537",
"assets/assets/images/pic04.jpg": "f847c18e4e7d7dad49ffb4d9de1fdf61",
"assets/assets/images/pic02.jpg": "97b7e4cb905caccc446689caa563c338",
"assets/assets/images/fondo1.jpg": "32de9dfbd937e5514d5a9c835f10d07b",
"assets/assets/images/fondo2.jpg": "9c318c3a3577040dfa7fb8c695988076",
"assets/assets/images/avatar.png": "7ceb2ecd1bca2368223899eda38943d2",
"assets/assets/images/banner.jpg": "db1c37cb59385d93aefa54f80acafe8a",
"assets/assets/images/avatar1.png": "86e40fbda65b110a534dd8b3bc3675d4",
"assets/assets/images/avatar.jpg": "a27fce23bc783bbd090536c0bba40396",
"assets/AssetManifest.json": "803a51f148d6f6bdac3b609d1241669a",
"assets/FontManifest.json": "f3f11ef349cd8c41d4df14830814d524",
"assets/fonts/fa-solid-900.ttf": "98e4fad2412cff8904750b3028f64f2b",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/packages/line_icons/lib/assets/fonts/LineIcons.ttf": "23621397bc1906a79180a918e98f35b2",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/NOTICES": "ad751173a6434c100a895d4c1f6c9dc4",
"icons/Icon-192.png": "09c3920401816547631ae17d969bc5d6",
"icons/Icon-192old.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/favicon.png": "67da2cb6d2650368894d48d14dcb9546",
"icons/favicon.ico": "4151ed40fda953c92c87b60c5fdb3537",
"icons/Icon-512old.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-512.png": "b346790543aa5b639f13f92b285230b1",
"favicon.png": "67da2cb6d2650368894d48d14dcb9546",
"manifest.json": "682863f48000bea3b08446ddd25c9e53",
"version.json": "a8f83101c2f51eceebd1cdcc7b8ff5fc",
"favicon.ico": "4151ed40fda953c92c87b60c5fdb3537",
"main.dart.js": "94755ab1657b1ddc82a48a11f123d38a",
"faviconold.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "51d5b7ccc555d6f82a03319ebf3a3c6d",
"/": "51d5b7ccc555d6f82a03319ebf3a3c6d"
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
