package accurics

privilegeEscalationCheck[pod.id] {
    pod := object.get(input, "kubernetes_deployment", "undefined")[_]
    secContext := pod.config.spec.template.spec.securityContext
    podSecurityCheck(secContext)
}

podSecurityCheck(secContext) {
    secContext.allowPrivilegeEscalation == "true"
}

podSecurityCheck(secContext) {
    object.get(secContext, "allowPrivilegeEscalation", "undefined") == "undefined"
}
