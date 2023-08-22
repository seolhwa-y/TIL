function solution(n, k) {
    // 양꼬치 n 음료수 k
    // 양꼬치 12,000 움료수 2,000
    // 양꼬치 10인분 먹으면 음료수 1개 서비스
    
    const a = Math.floor(n / 10);
    
    if(a > 0) k = k - a;
    if(k <= 0) k = 0;
    
    return (n * 12000) + (k * 2000);
}