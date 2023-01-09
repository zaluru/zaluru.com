<script>
    import { onMount } from "svelte";
    import { writable } from "svelte/store";
  
    // Show mobile icon and display menu
    let showMobileMenu = false;
    
    // List of navigation items
  const navItems = [
      {href: "/about", label: "About", pushRight: false},
      {href: "/blog", label: "Blog", pushRight: false},
      {href: "/git", label: "Git", pushRight: false},
      {href: "/videos", label: "Videos", pushRight: false},
      {href: "/music", label: "Music", pushRight: false},
      {href: "/rss", label: "rss", pushRight: false},
      {href: "/language", label: "Language", pushRight: true},
      {href: "theme", label: "Theme", pushRight: false},
  ]
  
    // Mobile menu click event handler
    const handleMobileIconClick = () => (showMobileMenu = !showMobileMenu);
  
    // Media match query handler
    const mediaQueryHandler = e => {
      // Reset mobile state
      if (!e.matches) {
        showMobileMenu = false;
      }
    };
    
    // Attach media query listener on mount hook
    onMount(() => {
      const mediaListener = window.matchMedia("(max-width: 767px)");
  
      mediaListener.addListener(mediaQueryHandler);
    });
  </script>
  
  <nav class="max-w-6xl px-4 py-5 mx-auto border-b-2 border-b-slate-300 flex flex-col">
    <a href="/" class="text-4xl pb-5 tracking-widest font-black">zaluru</a>
    <div>
      <!-- svelte-ignore a11y-click-events-have-key-events -->
      <div on:click={handleMobileIconClick} class={`mobile-icon md:hidden${showMobileMenu ? ' active' : ''}`}>
        <div class="middle-line">
        </div>
      </div>
      <ul class={`md:flex md:flex-row ${showMobileMenu ? ' flex flex-col' : 'hidden'}`}>
        {#each navItems as item}
          <li class={`pt-4 md:pt-0 md:first:border-l-0 md:first:pl-0 md:last:pr-0 md:border-l-2 md:px-4 font-bold ${item.pushRight ? ' md:border-l-0 md:ml-auto': ''}`}>
            <a class="" href={item.href}>{item.label}</a>
          </li>
        {/each}
      </ul>
    </div>
  </nav>
  
  <style>
    .mobile-icon {
      width: 25px;
      height: 14px;
      position: relative;
      cursor: pointer;
    }
  
    .mobile-icon:after,
    .mobile-icon:before,
    .middle-line {
      content: "";
      position: absolute;
      width: 100%;
      height: 2px;
      background-color: #fff;
      transition: all 0.4s;
      transform-origin: center;
    }
  
    .mobile-icon:before,
    .middle-line {
      top: 0;
    }
  
    .mobile-icon:after,
    .middle-line {
      bottom: 0;
    }
  
    .mobile-icon:before {
      width: 66%;
    }
  
    .mobile-icon:after {
      width: 33%;
    }
  
    .middle-line {
      margin: auto;
    }
  
    .mobile-icon:hover:before,
    .mobile-icon:hover:after,
    .mobile-icon.active:before,
    .mobile-icon.active:after,
    .mobile-icon.active .middle-line {
      width: 100%;
    }
  
    .mobile-icon.active:before,
    .mobile-icon.active:after {
      top: 50%;
      transform: rotate(-45deg);
    }
  
    .mobile-icon.active .middle-line {
      transform: rotate(45deg);
    }
  
  </style>