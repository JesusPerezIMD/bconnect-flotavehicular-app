'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "be51de7b02a0ea85df114bcd55c9cee7",
"assets/AssetManifest.json": "5700b7829ffb0220e01d37d86f01b07f",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "d81bd9ec0d49802cded08c06c447d29d",
"assets/NOTICES": "afef29e673966a10b31c338f2d1cce9f",
"assets/packages/advance_image_picker/assets/icon/1.png": "7d66c70acb7306487edbd6f7d361b9aa",
"assets/packages/advance_image_picker/assets/icon/10.png": "2ac443535c646cf5c025c695d378977e",
"assets/packages/advance_image_picker/assets/icon/11.png": "849c5e7d3c945eed42952a0232fe848e",
"assets/packages/advance_image_picker/assets/icon/12.png": "b12255cad0989a1fcc2456e55636cad0",
"assets/packages/advance_image_picker/assets/icon/13.png": "30bff375f79e0a70fac66638a9f0a034",
"assets/packages/advance_image_picker/assets/icon/14.png": "4a001c1d8f9bc9b8dd5c7c6270a1460b",
"assets/packages/advance_image_picker/assets/icon/15.png": "e6a437c256eee751c1c978e7017409fc",
"assets/packages/advance_image_picker/assets/icon/16.png": "6ec91426003f266bbbf6cc320fcc7a41",
"assets/packages/advance_image_picker/assets/icon/17.png": "52379c8603f1d359c4ce926151633aef",
"assets/packages/advance_image_picker/assets/icon/18.png": "a152100e161f33640ac00355909ec37b",
"assets/packages/advance_image_picker/assets/icon/19.png": "7ee43b2dec7dfeca50f4dc8068f4c9ae",
"assets/packages/advance_image_picker/assets/icon/2.png": "993681d0ab396cd8a1b8bfdb2c1cffb3",
"assets/packages/advance_image_picker/assets/icon/20.png": "7361fa283c3605e7a225185543ecef4a",
"assets/packages/advance_image_picker/assets/icon/21.png": "f4bb559cf1fa709bdb1ed1091ce9d553",
"assets/packages/advance_image_picker/assets/icon/22.png": "db4d971cfb40e103a0d57f0776e3cc3d",
"assets/packages/advance_image_picker/assets/icon/23.png": "b81b6a618fcdae70c2deff2c1f936e77",
"assets/packages/advance_image_picker/assets/icon/24.png": "0cc5c2bf72d2283ddaba7cb3ff4da017",
"assets/packages/advance_image_picker/assets/icon/25.png": "6cb1c332f54d1c9e95c9d61fe3189cdb",
"assets/packages/advance_image_picker/assets/icon/26.png": "5eb71ba01e6ec89a62fb6286e7f089d2",
"assets/packages/advance_image_picker/assets/icon/27.png": "912b195b66c3e780d49bb4f2f1cb0908",
"assets/packages/advance_image_picker/assets/icon/28.png": "fdb91d567a5608f8d665834570e3341b",
"assets/packages/advance_image_picker/assets/icon/29.png": "9301a293cfb43c284a518b9a0443ab09",
"assets/packages/advance_image_picker/assets/icon/3.png": "5cbc71364be2a499e213ca936df4b4b6",
"assets/packages/advance_image_picker/assets/icon/30.png": "932d4cf6a9ab3b0693d7851972398443",
"assets/packages/advance_image_picker/assets/icon/31.png": "8b85a7a712b3b485b6453c1b97c83e34",
"assets/packages/advance_image_picker/assets/icon/32.png": "3ca81421f51e92cfd0974c75626b6f0d",
"assets/packages/advance_image_picker/assets/icon/33.png": "01b4c52656b46fde89ecb73bdb344111",
"assets/packages/advance_image_picker/assets/icon/34.png": "258920a1f015dfb45c35c84b316a126f",
"assets/packages/advance_image_picker/assets/icon/4.png": "3051ce6f6329df4ffa6d01e0ed6629b1",
"assets/packages/advance_image_picker/assets/icon/5.png": "23ef358e745acb01306d7e8c4009d107",
"assets/packages/advance_image_picker/assets/icon/6.png": "c509b635ea914fbfb106bf614f961e6e",
"assets/packages/advance_image_picker/assets/icon/7.png": "ba8c4b8832bb9db3e1bd0839e0247f8f",
"assets/packages/advance_image_picker/assets/icon/8.png": "0eb3727339956d8309e952c306360673",
"assets/packages/advance_image_picker/assets/icon/9.png": "f6a56b89a728f0bb968a5754b3b102a7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "bbf39143dfd758d8d847453b120c8ebb",
"canvaskit/canvaskit.wasm": "42df12e09ecc0d5a4a34a69d7ee44314",
"canvaskit/chromium/canvaskit.js": "96ae916cd2d1b7320fff853ee22aebb0",
"canvaskit/chromium/canvaskit.wasm": "be0e3b33510f5b7b0cc76cc4d3e50048",
"canvaskit/profiling/canvaskit.js": "e069e181424052299c5bffb1b300bb13",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "1a074e8452fe5e0d02b112e22cdcf455",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "ce7fadd53eab1c95919fc0e957c722f5",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/android-icon-144x144.png": "f070818491736f5518dd58e0ad6151d6",
"icons/android-icon-192x192.png": "23c1d36d323a907f5b1e976f2da03dc4",
"icons/android-icon-36x36.png": "d32d0d3b610279a4067cb43e8ca81979",
"icons/android-icon-48x48.png": "a64a0e45b37b16471070e561c6f1f0d7",
"icons/android-icon-72x72.png": "11a9238e2eb2cb5484eb92b47fc204cf",
"icons/android-icon-96x96.png": "0b6566c59ef88fff6f59bec8a132cc5e",
"icons/apple-icon-114x114.png": "7460f2a2c243638aa3bdbdefd16a9d37",
"icons/apple-icon-120x120.png": "c202169a7771f051021a1d44fa1f5028",
"icons/apple-icon-144x144.png": "f070818491736f5518dd58e0ad6151d6",
"icons/apple-icon-152x152.png": "a5a2a13f542aa8b524d9b1fd673b1b9d",
"icons/apple-icon-180x180.png": "1ddc181d942faf9b224cb86df2f61c54",
"icons/apple-icon-57x57.png": "e9c80b248f623f63743c718c72577022",
"icons/apple-icon-60x60.png": "3a6fdfbbc7ac3352e9ae83786f7f3b10",
"icons/apple-icon-72x72.png": "11a9238e2eb2cb5484eb92b47fc204cf",
"icons/apple-icon-76x76.png": "8f770a4c8baefb4b0e308688961e79e1",
"icons/apple-icon-precomposed.png": "240d2187d3f260c8a2c7bdb8aae546c7",
"icons/apple-icon.png": "240d2187d3f260c8a2c7bdb8aae546c7",
"icons/browserconfig.xml": "97775b1fd3b6e6c13fc719c2c7dd0ffe",
"icons/favicon-16x16.png": "6997f946e889a9da437f268c3417b5e5",
"icons/favicon-32x32.png": "e04933434658680e69851e038df95ede",
"icons/favicon-96x96.png": "0b6566c59ef88fff6f59bec8a132cc5e",
"icons/Icon-192.png": "10b32449598f3a0c6e2040d34b1b210b",
"icons/Icon-512.png": "784aec1efe3f9b8d138aebf2d14aee49",
"icons/Icon-maskable-192.png": "10b32449598f3a0c6e2040d34b1b210b",
"icons/Icon-maskable-512.png": "784aec1efe3f9b8d138aebf2d14aee49",
"icons/ms-icon-144x144.png": "f070818491736f5518dd58e0ad6151d6",
"icons/ms-icon-150x150.png": "d9fd1550db09ff6d28d22201090d66c0",
"icons/ms-icon-310x310.png": "215b0496e310544ea4cc13199875cd72",
"icons/ms-icon-70x70.png": "afe64698f086e093b63911f113743f1f",
"index.html": "d9b75d5eab63257953d9c9425042a1e1",
"/": "d9b75d5eab63257953d9c9425042a1e1",
"main.dart.js": "5e8215af7c14f7673cc07fb3fc8d709f",
"manifest.json": "5b85ac28ba704beec03b337954c01deb",
"version.json": "310b27bde8c85ce6ac24cea189cca5bb",
"web.config": "76d811b420ea6d5c1af07f893679d565"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
