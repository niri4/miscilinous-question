def post_order(root, children):
    to_visit = []
    visited_ancestors = []
    to_visit.append(root)
    visited_ancestors.append(None)
    while to_visit:
        node = to_visit[-1]
        ch = children[node]
        if ch:
            if visited_ancestors[-1] != node:
                visited_ancestors.append(node)
                to_visit.extend(ch)
                continue
            visited_ancestors.pop()
        yield node
        to_visit.pop()

# T. M. Kratzke and D. B. West. The total interval number of a graph II:
# Trees and complexity. SIAM J. Discrete Math., 9(2):339-348, 1996.
def trail_cover(n, root, children):
    trno = [0] * n
    code = [0] * n
    for node in post_order(0, children):
        ch = children[node]
        if ch:
            s = sum(trno[c] for c in ch)
            k = [0] * 4
            for c in ch: k[code[c]] += 1
            if k[2] + k[3] == 0:
                if k[1] == len(ch):
                    trno[node] = s
                    code[node] = 0
                else:
                    trno[node] = 1 + s
                    code[node] = 3
            else:
                trno[node] = s - (k[2] + k[3]) // 2
                code[node] = 1 if (k[2] + k[3]) % 2 == 0 else 2
    return trno[0]

def solve(n, edges):
#     adjacency
    adj = [[] for _ in xrange(n)]
    for a, b in edges:
        adj[a].append(b)
        adj[b].append(a)
#     tree
    parent = [-1 for _ in xrange(n)]
    children = [[] for _ in xrange(n)]
    stack = [0]
    while stack:
        node = stack.pop()
        ch = [c for c in adj[node] if c != parent[node]]
        children[node] = ch
        for c in ch: parent[c] = node
        stack.extend(ch)
#     trail cover
    return trail_cover(n, 0, children)

if __name__ == "__main__":
    def read_ints(): return map(int, raw_input().split())
    def main():
        for _ in xrange(input()):
            n = input()
            edges = [read_ints() for _i in xrange(n - 1)]
            print solve(n, edges)
    main()
