'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "a8297d555dd34879e8e48e1cf12acefa",
".git/config": "4bc6e3ac5b347e4ad651f2cfdbc29524",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "fe70f023caf22cab5b98832c0c2929fa",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "5d5602a5fcc8eacf7276693c1f8367a9",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "60403242b7d37dab6c5eb267d4c5716f",
".git/logs/refs/heads/main": "9b66ba4a96cd0a0051dbb4e4aedb734c",
".git/logs/refs/remotes/origin/main": "bad4ac585a8633b760fbd3f27aea0f87",
".git/logs/refs/remotes/origin/viren": "25e2defdb7da9a22d4fd5be679a9ed00",
".git/objects/09/712118ad0e27816d3476ab7da03518a64d3b43": "665f3f437e32bb35e9da18d8e3b5777c",
".git/objects/0f/ea10645e0a1a25916650712786bc13a658fece": "c68fe67c916bf5176bb9ea8aa087cfcc",
".git/objects/18/541ea9b78e896ca02804732c2adbf4b28968b7": "af48cfd87d1132002bedfad1392ce2cf",
".git/objects/1a/161feb435bdb2388547347361df6548a073f58": "7231e938a94e073086407f80e347e55a",
".git/objects/1e/f9ceca46dc58a0efbfb47877d2c0e5297a52cf": "bb15a4eb3e689e93ada62b970ffeaf95",
".git/objects/1f/b87e5bc9821396198fccc59fc6e11c9e4c8bb9": "7bfad0347e8af29e796e4d3237fb2ae5",
".git/objects/2e/abdee5f52df4dbea1ce6a0360e372b62455f47": "86b12671ac73564994700cbe34f5c3e0",
".git/objects/34/f0dd83a3a79d66cc17e87a284e33dadadf29fe": "608699f2555dccce46cc6a7f1a8613ff",
".git/objects/35/5d4e20e5dfb0c783baedaf18055252760dc843": "f86a1a8f63eae793c6d83ab438d5c5a1",
".git/objects/4b/825dc642cb6eb9a060e54bf8d69288fbee4904": "75589287973d2772c2fc69d664e10822",
".git/objects/50/9480c418365df2d0a40810e4827634ce5df69e": "d05e51e30f0f7b34545ba08b2a7b711f",
".git/objects/5e/a9b8146328960455f5b11e6f686267ec71ad0a": "944f7cc91f1557cca7e78da57a8591e2",
".git/objects/83/44224ca34dadf8f0fe47b7a752e924fcc63bd3": "60400e04378df10728f2d7cc3b17ae4b",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/96/bca696dbdcf3ba00d66aa167d8a76c5f196099": "84078a516ef1120843ebb1ba67e194fc",
".git/objects/9d/dddc3393e980e3d6b49fc8fde376e613d3ffed": "a1feaab864250dedff806c6d9be9a831",
".git/objects/a0/81f99f7318440e663fae52f718b7d4fdb5949d": "f6a6b2f2716d6b892f823a558d4feb48",
".git/objects/a7/0f5a13567dd2f3a58b7d9827aa13ac40078349": "a6b511fb3f76dd46c6e88494d9db9da4",
".git/objects/aa/2478830295333e239f89b987e43159ea246d8f": "6963f5b4c3c742750120e103d66f621f",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/c0/8dc05873dc7e773dd287cccd9f368ffb054492": "468b32bfd31f4fb978199a6c1d58e32b",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/de/54ad1fcd9253417a3c75dd7196bfb07161100e": "283cbb0749558b2ffc50f0262ffc469f",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f2/cb1307008fa427cee81159c03b8a4629e0214b": "bcd8c69838cd128c44d56ac2826eb75e",
".git/ORIG_HEAD": "f01b41bcab4df8476fd0e2b3e433984f",
".git/refs/heads/main": "461dbd754b6607df7958c4ac051396b5",
".git/refs/remotes/origin/main": "461dbd754b6607df7958c4ac051396b5",
".git/refs/remotes/origin/viren": "f9f23a6d358084721a0acf4be7ff5eca",
"assets/AssetManifest.bin": "bd3dfa1c9ec342360f53f10d81363bf2",
"assets/AssetManifest.bin.json": "5f9483f9828be42af4f8fc5d8ef9bd13",
"assets/AssetManifest.json": "c87b6aeb58a8c1d862e9546831f7c5a0",
"assets/assets/loaderImg.gif": "9d1fe0c32b29334cf4ca514ee6f14a7a",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "7362cb5807dd34ce7cdb76078588ae17",
"assets/NOTICES": "2ec03856312447da33faacbfcae3cdfd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "5bc83814f3f68c3e5f8f6b6bdeab1f50",
"flutter_bootstrap.js": "c28ee9825fe06862adb09a4820d3af72",
"index.html": "53f2967d93069b1303963cdb301ecf09",
"/": "53f2967d93069b1303963cdb301ecf09",
"main.dart.js": "4c41e0873746de065680a546d66bebee",
"manifest.json": "28187ba135d471a959a2770216aa7a30",
"version.json": "55a18913440a39ab1698f27d0426109a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
