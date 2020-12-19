int main () {
    int f = 1;
    int v = 0;
    int t = 0;

    for (int i = 0; i < 10; i++) {
        f = v + t;
        t = v;
        v = f;
    }
}