document.addEventListener('DOMContentLoaded', function() {
    // Mobile menu toggle
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const navLinks = document.querySelector('.nav-links');

    mobileMenuBtn?.addEventListener('click', () => {
        navLinks?.classList.toggle('active');
    });

    // Experience details toggle
    const toggleButtons = document.querySelectorAll('.toggle-details');

    toggleButtons.forEach(button => {
        button.addEventListener('click', () => {
            const targetId = button.getAttribute('data-target');
            const detailsSection = document.getElementById(targetId);
            const chevron = button.querySelector('.chevron');

            if (detailsSection) {
                const isHidden = detailsSection.classList.contains('hidden');
                
                // Close all other sections
                document.querySelectorAll('.experience-details').forEach(section => {
                    if (section.id !== targetId) {
                        section.classList.add('hidden');
                        const otherButton = document.querySelector(`[data-target="${section.id}"]`);
                        otherButton?.setAttribute('aria-expanded', 'false');
                        const otherChevron = otherButton?.querySelector('.chevron');
                        if (otherChevron) {
                            otherChevron.style.transform = 'rotate(0deg)';
                        }
                    }
                });

                // Toggle current section
                detailsSection.classList.toggle('hidden');
                button.setAttribute('aria-expanded', isHidden ? 'true' : 'false');
                
                if (chevron) {
                    chevron.style.transform = isHidden ? 'rotate(180deg)' : 'rotate(0deg)';
                }
            }
        });
    });

    // Smooth scroll for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
                // Close mobile menu if open
                navLinks?.classList.remove('active');
            }
        });
    });
});