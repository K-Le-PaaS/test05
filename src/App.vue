<template>
  <div id="app">
    <header class="header">
      <h1>K-Le-PaaS Vue Test</h1>
      <p>쿠버네티스 자동화 배포 테스트용 Vue.js 애플리케이션</p>
    </header>
    
    <main class="main">
      <div class="card">
        <h2>서비스 상태</h2>
        <div class="status">
          <span class="status-indicator">🟢</span>
          <span>정상 동작 중</span>
        </div>
      </div>
      
      <div class="card">
        <h2>기능 테스트</h2>
        <button @click="incrementCounter" class="btn">
          클릭 횟수: {{ counter }}
        </button>
        <p class="info">버튼을 클릭하여 상호작용을 테스트해보세요</p>
      </div>
      
      <div class="card">
        <h2>시스템 정보</h2>
        <ul class="info-list">
          <li>프레임워크: Vue.js 3</li>
          <li>빌드 도구: Vite</li>
          <li>배포 환경: Kubernetes</li>
          <li>현재 시간: {{ currentTime }}</li>
        </ul>
      </div>
    </main>
  </div>
</template>

<script>
import { ref, onMounted, onUnmounted } from 'vue'

export default {
  name: 'App',
  setup() {
    const counter = ref(0)
    const currentTime = ref('')
    
    const incrementCounter = () => {
      counter.value++
    }
    
    const updateTime = () => {
      currentTime.value = new Date().toLocaleString('ko-KR')
    }
    
    let timeInterval
    
    onMounted(() => {
      updateTime()
      timeInterval = setInterval(updateTime, 1000)
    })
    
    onUnmounted(() => {
      if (timeInterval) {
        clearInterval(timeInterval)
      }
    })
    
    return {
      counter,
      currentTime,
      incrementCounter
    }
  }
}
</script>
